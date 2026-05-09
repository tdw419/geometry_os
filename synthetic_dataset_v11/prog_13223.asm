; DESCRIPTION: Places a cyan 28x119 rectangle at position (63, 44).
; PLAN: r0=63(x), r1=44(y), r2=28(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 44
LDI r2, 28
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
