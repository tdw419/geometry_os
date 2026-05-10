; DESCRIPTION: Places a cyan 75x109 rectangle at position (154, 86).
; PLAN: r0=154(x), r1=86(y), r2=75(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 86
LDI r2, 75
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
