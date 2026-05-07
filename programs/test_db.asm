; Test .db directive
.db 42
.db 99
.db 0xFF00100
LDI r1, 0
LOAD r2, r1
LDI r1, 1
LOAD r3, r1
LDI r1, 2
LOAD r4, r1
HALT
