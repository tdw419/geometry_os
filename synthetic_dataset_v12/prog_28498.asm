; DESCRIPTION: Creates a cyan rectangular region at (206, 10) spanning 98 by 69 pixels.
; PLAN: r0=206(x), r1=10(y), r2=98(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 10
LDI r2, 98
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
