; DESCRIPTION: Creates a cyan rectangular region at (147, 205) spanning 103 by 32 pixels.
; PLAN: r0=147(x), r1=205(y), r2=103(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 205
LDI r2, 103
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
