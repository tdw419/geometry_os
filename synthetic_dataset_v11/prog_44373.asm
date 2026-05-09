; DESCRIPTION: Composite: . Then Renders a orange disk with center (105, 146) and radius 80. Then Renders a cyan box of size 25x120 starting at (169, 3).
; PLAN: r0=105(x), r1=146(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=169(x), r1=3(y), r2=25(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (105, 146) and radius 80.
; PLAN: r0=105(x), r1=146(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 146
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 25x120 starting at (169, 3).
; PLAN: r0=169(x), r1=3(y), r2=25(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 3
LDI r2, 25
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
