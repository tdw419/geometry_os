; DESCRIPTION: Creates a cyan rectangular region at (433, 193) spanning 76 by 50 pixels.
; PLAN: r0=433(x), r1=193(y), r2=76(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 193
LDI r2, 76
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
