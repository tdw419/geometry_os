; DESCRIPTION: Creates a orange rectangular region at (215, 70) spanning 48 by 94 pixels.
; PLAN: r0=215(x), r1=70(y), r2=48(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 70
LDI r2, 48
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
