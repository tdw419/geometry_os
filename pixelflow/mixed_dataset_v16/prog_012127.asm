; DESCRIPTION: Renders a red rectangular region spanning 49 by 98 at (392, 167).
; PLAN: r0=392(x), r1=167(y), r2=49(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 167
LDI r2, 49
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
