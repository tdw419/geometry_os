; DESCRIPTION: Creates a cyan rectangular region at (413, 125) spanning 32 by 85 pixels.
; PLAN: r0=413(x), r1=125(y), r2=32(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 125
LDI r2, 32
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
