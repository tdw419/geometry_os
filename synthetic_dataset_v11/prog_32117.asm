; DESCRIPTION: Composite: . Then Places a yellow 110x61 rectangle at position (114, 77). Then Places a white circle of radius 57 at center (112, 146).
; PLAN: r0=114(x), r1=77(y), r2=110(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=146(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 110x61 rectangle at position (114, 77).
; PLAN: r0=114(x), r1=77(y), r2=110(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 77
LDI r2, 110
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 57 at center (112, 146).
; PLAN: r0=112(x), r1=146(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
