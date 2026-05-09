; DESCRIPTION: Creates a cyan rectangular region at (117, 69) spanning 107 by 120 pixels.
; PLAN: r0=117(x), r1=69(y), r2=107(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 69
LDI r2, 107
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
