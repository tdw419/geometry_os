; DESCRIPTION: Places a cyan 51x91 rectangle at position (431, 150).
; PLAN: r0=431(x), r1=150(y), r2=51(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 150
LDI r2, 51
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
