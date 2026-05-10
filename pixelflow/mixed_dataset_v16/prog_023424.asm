; DESCRIPTION: Creates a cyan rectangular region at (281, 161) spanning 93 by 93 pixels.
; PLAN: r0=281(x), r1=161(y), r2=93(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 161
LDI r2, 93
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
