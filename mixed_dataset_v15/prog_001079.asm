; DESCRIPTION: Places a orange 54x21 box at position (242, 164).
; PLAN: r0=242(x), r1=164(y), r2=54(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 164
LDI r2, 54
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
