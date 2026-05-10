; DESCRIPTION: Creates a cyan rectangular region at (392, 204) spanning 107 by 19 pixels.
; PLAN: r0=392(x), r1=204(y), r2=107(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 204
LDI r2, 107
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
