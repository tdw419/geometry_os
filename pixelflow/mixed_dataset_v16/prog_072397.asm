; DESCRIPTION: Creates a cyan rectangular region at (167, 197) spanning 75 by 32 pixels.
; PLAN: r0=167(x), r1=197(y), r2=75(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 197
LDI r2, 75
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
