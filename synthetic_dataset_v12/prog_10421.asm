; DESCRIPTION: Creates a red rectangular region at (214, 218) spanning 20 by 16 pixels.
; PLAN: r0=214(x), r1=218(y), r2=20(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 218
LDI r2, 20
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
