; DESCRIPTION: Renders a red box of size 43x109 starting at (450, 125).
; PLAN: r0=450(x), r1=125(y), r2=43(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 125
LDI r2, 43
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
