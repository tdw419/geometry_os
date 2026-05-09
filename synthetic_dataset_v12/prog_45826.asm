; DESCRIPTION: Places a cyan 82x63 rectangle at position (264, 51).
; PLAN: r0=264(x), r1=51(y), r2=82(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 51
LDI r2, 82
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
