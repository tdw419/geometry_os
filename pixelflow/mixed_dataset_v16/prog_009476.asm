; DESCRIPTION: Places a cyan 115x90 rectangle at position (55, 146).
; PLAN: r0=55(x), r1=146(y), r2=115(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 146
LDI r2, 115
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
