; DESCRIPTION: Composite: . Then Creates a white rectangular region at (115, 202) spanning 58 by 36 pixels. Then Places a cyan circle of radius 54 at center (90, 114).
; PLAN: r0=115(x), r1=202(y), r2=58(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=114(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (115, 202) spanning 58 by 36 pixels.
; PLAN: r0=115(x), r1=202(y), r2=58(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 202
LDI r2, 58
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 54 at center (90, 114).
; PLAN: r0=90(x), r1=114(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 114
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
