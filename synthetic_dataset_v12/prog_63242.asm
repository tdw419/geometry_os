; DESCRIPTION: Creates a red rectangular region at (419, 143) spanning 68 by 36 pixels.
; PLAN: r0=419(x), r1=143(y), r2=68(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 143
LDI r2, 68
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
