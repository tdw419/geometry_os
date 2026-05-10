; DESCRIPTION: Places a magenta dot at position (214, 213).
; PLAN: r0=214(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
