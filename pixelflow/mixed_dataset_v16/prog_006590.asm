; DESCRIPTION: Renders a red rectangular region spanning 71 by 95 at (392, 115).
; PLAN: r0=392(x), r1=115(y), r2=71(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 115
LDI r2, 71
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
