; DESCRIPTION: Places a cyan 82x76 rectangle at position (50, 127).
; PLAN: r0=50(x), r1=127(y), r2=82(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 127
LDI r2, 82
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
