; DESCRIPTION: Renders a white box of size 22x113 starting at (165, 92).
; PLAN: r0=165(x), r1=92(y), r2=22(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 92
LDI r2, 22
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
