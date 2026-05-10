; DESCRIPTION: Creates a cyan filled rectangle of size 56x55 starting at (309, 174).
; PLAN: r0=309(x), r1=174(y), r2=56(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 174
LDI r2, 56
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
