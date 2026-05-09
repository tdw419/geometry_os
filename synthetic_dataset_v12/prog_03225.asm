; DESCRIPTION: Places a green 82x74 rectangle at position (198, 120).
; PLAN: r0=198(x), r1=120(y), r2=82(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 120
LDI r2, 82
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
