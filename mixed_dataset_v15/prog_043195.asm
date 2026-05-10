; DESCRIPTION: Creates a cyan rectangular region at (87, 208) spanning 72 by 27 pixels.
; PLAN: r0=87(x), r1=208(y), r2=72(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 208
LDI r2, 72
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
