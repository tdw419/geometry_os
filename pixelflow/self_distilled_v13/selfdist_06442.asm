; DESCRIPTION: Places a cyan 93x24 box at position (361, 146).
; PLAN: r0=361(x), r1=146(y), r2=93(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 146
LDI r2, 93
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
