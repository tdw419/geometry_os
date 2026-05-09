; DESCRIPTION: Places a cyan 102x95 rectangle at position (66, 96).
; PLAN: r0=66(x), r1=96(y), r2=102(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 96
LDI r2, 102
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
