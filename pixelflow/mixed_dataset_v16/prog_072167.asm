; DESCRIPTION: Creates a cyan rectangular region at (187, 172) spanning 103 by 63 pixels.
; PLAN: r0=187(x), r1=172(y), r2=103(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 172
LDI r2, 103
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
