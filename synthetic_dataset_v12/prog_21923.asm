; DESCRIPTION: Creates a cyan rectangular region at (64, 142) spanning 120 by 65 pixels.
; PLAN: r0=64(x), r1=142(y), r2=120(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 142
LDI r2, 120
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
