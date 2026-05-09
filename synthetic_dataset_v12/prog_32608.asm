; DESCRIPTION: Renders a red box of size 98x70 starting at (213, 20).
; PLAN: r0=213(x), r1=20(y), r2=98(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 20
LDI r2, 98
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
