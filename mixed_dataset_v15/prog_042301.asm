; DESCRIPTION: Renders a red box of size 75x12 starting at (277, 240).
; PLAN: r0=277(x), r1=240(y), r2=75(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 240
LDI r2, 75
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
