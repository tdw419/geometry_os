; DESCRIPTION: Draws a orange line from (242, 239) to (281, 228).
; PLAN: r0=242(x1), r1=239(y1), r2=281(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 239
LDI r2, 281
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
