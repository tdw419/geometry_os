; DESCRIPTION: Places a cyan 56x79 rectangle at position (28, 65).
; PLAN: r0=28(x), r1=65(y), r2=56(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 65
LDI r2, 56
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
