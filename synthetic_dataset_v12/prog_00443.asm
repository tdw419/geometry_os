; DESCRIPTION: Creates a cyan rectangular region at (386, 179) spanning 80 by 72 pixels.
; PLAN: r0=386(x), r1=179(y), r2=80(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 179
LDI r2, 80
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
