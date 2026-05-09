; DESCRIPTION: Composite: . Then Places a white circle of radius 17 at center (168, 146). Then Draws a white line from (68, 254) to (82, 61).
; PLAN: r0=168(x), r1=146(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=68(x1), r1=254(y1), r2=82(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 17 at center (168, 146).
; PLAN: r0=168(x), r1=146(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 146
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (68, 254) to (82, 61).
; PLAN: r0=68(x1), r1=254(y1), r2=82(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 254
LDI r2, 82
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
