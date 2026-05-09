; DESCRIPTION: Places a cyan 111x110 rectangle at position (95, 119).
; PLAN: r0=95(x), r1=119(y), r2=111(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 119
LDI r2, 111
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
