; DESCRIPTION: Places a cyan 109x86 rectangle at position (95, 37).
; PLAN: r0=95(x), r1=37(y), r2=109(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 37
LDI r2, 109
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
