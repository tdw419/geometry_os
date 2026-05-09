; DESCRIPTION: Places a cyan 56x61 rectangle at position (389, 186).
; PLAN: r0=389(x), r1=186(y), r2=56(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 186
LDI r2, 56
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
