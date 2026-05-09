; DESCRIPTION: Places a cyan 74x93 rectangle at position (105, 146).
; PLAN: r0=105(x), r1=146(y), r2=74(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 146
LDI r2, 74
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
