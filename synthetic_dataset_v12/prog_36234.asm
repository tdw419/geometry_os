; DESCRIPTION: Places a cyan 70x61 rectangle at position (292, 186).
; PLAN: r0=292(x), r1=186(y), r2=70(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 186
LDI r2, 70
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
