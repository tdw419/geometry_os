; DESCRIPTION: Creates a cyan rectangular region at (184, 190) spanning 90 by 63 pixels.
; PLAN: r0=184(x), r1=190(y), r2=90(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 190
LDI r2, 90
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
