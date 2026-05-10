; DESCRIPTION: Renders a red box of size 75x60 starting at (362, 108).
; PLAN: r0=362(x), r1=108(y), r2=75(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 108
LDI r2, 75
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
