; DESCRIPTION: Renders a red box of size 50x91 starting at (279, 142).
; PLAN: r0=279(x), r1=142(y), r2=50(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 142
LDI r2, 50
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
