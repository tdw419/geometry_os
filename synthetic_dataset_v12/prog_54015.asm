; DESCRIPTION: Creates a cyan rectangular region at (434, 94) spanning 64 by 102 pixels.
; PLAN: r0=434(x), r1=94(y), r2=64(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 94
LDI r2, 64
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
