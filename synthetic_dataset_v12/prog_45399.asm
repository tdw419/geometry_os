; DESCRIPTION: Creates a cyan rectangular region at (80, 179) spanning 16 by 53 pixels.
; PLAN: r0=80(x), r1=179(y), r2=16(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 179
LDI r2, 16
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
