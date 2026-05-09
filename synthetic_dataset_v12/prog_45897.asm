; DESCRIPTION: Places a cyan 92x97 rectangle at position (367, 37).
; PLAN: r0=367(x), r1=37(y), r2=92(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 37
LDI r2, 92
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
