; DESCRIPTION: Places a cyan 10x82 rectangle at position (125, 172).
; PLAN: r0=125(x), r1=172(y), r2=10(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 172
LDI r2, 10
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
