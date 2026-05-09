; DESCRIPTION: Places a white 25x109 rectangle at position (242, 51).
; PLAN: r0=242(x), r1=51(y), r2=25(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 51
LDI r2, 25
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
