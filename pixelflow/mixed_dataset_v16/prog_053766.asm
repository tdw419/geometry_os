; DESCRIPTION: Places a cyan 79x39 rectangle at position (187, 115).
; PLAN: r0=187(x), r1=115(y), r2=79(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 115
LDI r2, 79
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
