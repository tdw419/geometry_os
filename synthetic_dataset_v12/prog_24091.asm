; DESCRIPTION: Creates a cyan rectangular region at (197, 176) spanning 81 by 20 pixels.
; PLAN: r0=197(x), r1=176(y), r2=81(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 176
LDI r2, 81
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
