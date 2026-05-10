; DESCRIPTION: Places a cyan 38x60 rectangle at position (262, 11).
; PLAN: r0=262(x), r1=11(y), r2=38(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 11
LDI r2, 38
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
