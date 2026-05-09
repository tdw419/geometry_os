; DESCRIPTION: Creates a red rectangular region at (428, 133) spanning 10 by 111 pixels.
; PLAN: r0=428(x), r1=133(y), r2=10(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 133
LDI r2, 10
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
