; DESCRIPTION: Composite: . Then Places a cyan circle of radius 67 at center (168, 186). Then Places a white line segment connecting (93, 186) to (245, 42).
; PLAN: r0=168(x), r1=186(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x1), r1=186(y1), r2=245(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 67 at center (168, 186).
; PLAN: r0=168(x), r1=186(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 186
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (93, 186) to (245, 42).
; PLAN: r0=93(x1), r1=186(y1), r2=245(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 186
LDI r2, 245
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
